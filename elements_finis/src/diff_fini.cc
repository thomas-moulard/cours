#include <boost/numeric/ublas/matrix_sparse.hpp>
#include <boost/numeric/ublas/vector.hpp>
#include <boost/numeric/ublas/io.hpp>
#include <cmath>

typedef double value_t;
typedef boost::numeric::ublas::mapped_matrix<value_t> matrix_t;
typedef boost::numeric::ublas::vector<value_t> vector_t;

matrix_t make_matrix(vector_t c, value_t h)
{
  int size = c.size();
  matrix_t m(size, size);
  value_t ih = 1 / (h * h);
  m(0,0) = c(0) + 2 * ih;
  m(0,1) = -ih;
  std::cerr << "make_matrix" << std::endl;

  for (int i = 1; i < m.size1() - 1; ++i)
  {
    m(i, i - 1) = -ih;
    m(i, i) = c(i) + 2 * ih;
    m(i, i + 1) = -ih;
  }
  int i = m.size1() - 1;
  m(i, i - 1) = -ih;
  m(i, i) = c(i) + 2 * ih;
  return m;
}

matrix_t decompositionLL(matrix_t a)
{
  using std::sqrt;
  std::cerr << "decomposition LL" << std::endl;
  matrix_t l(a.size1(), a.size2());

  for (int j = 0; j < l.size2(); ++j)
  {
    // compute diagonal element first
    value_t sum = 0;
    for (int k = 0; k < j; ++k)
      sum += l(j, k) * l(j, k);
    l(j, j) = sqrt(a(j, j) - sum);

    // compute a the row j under l(j,j)
    for (int i = j + 1; i < a.size1(); ++i)
    {
      sum = 0;
      for (int k = 0; k < j; ++k)
	sum += l(i, k) * l(k, i);
      l(i, j) = (a(i, j) - sum) / l(j, j);
    }
  }
  std::cerr << "fin decomposition LL" << std::endl;
  return l;
}

vector_t resolve_cholesky(matrix_t l, vector_t f)
{
  vector_t y(f.size());
  std::cerr << "cholesky" << std::endl;
  for (int i = 0; i < l.size1(); ++i)
  {
    value_t sum = 0;
    for (int k = 0; k < i; ++k)
      sum += y(k) * l(i, k);
    y(i) = (f(i) - sum) / l(i, i);
  }

  vector_t u(f.size());
  for (int i = l.size1() - 1; i >= 0; --i)
  {
    value_t sum = 0;
    for (int k = l.size1() - 1; k > i; --k)
      sum += u(k) * l(k, i);
    u(i) = (y(i) - sum) / l(i, i);
  }
  std::cerr << "fin cholesky" << std::endl;
  return u;
}

int main ()
{
  int size = 20;
  vector_t c(size);
  vector_t f(size);

  for (int i = 0; i < size; ++i)
  {
    c(i) = 5;
    f(i) = 15;
  }

  matrix_t m = make_matrix(c, 1);
  vector_t x = resolve_cholesky(decompositionLL(m), f);

  for (int i = 0; i < size; ++i)
    std::cout << x(i) << std::endl;
  return 0;
}
