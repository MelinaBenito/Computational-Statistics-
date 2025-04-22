\name{generar_notas}
\alias{generar_notas}
\title{Generador de notas por categoría}
\usage{
generar_notas(n, porcentaje_aprobados = 0.5, semilla = 123)
}
\arguments{
  \item{n}{Número total de notas a generar.}
  \item{porcentaje_aprobados}{Proporción de notas aprobadas, valor entre 0 y 1.}
  \item{semilla}{Valor inicial del generador aleatorio (por defecto es 123).}
}
\description{
Genera un conjunto de notas aleatorias clasificadas como "Aprobado" o "Desaprobado" utilizando un generador congruencial lineal. Las notas pueden ser enteras o decimales, y se devuelven en un \code{data.frame}.
}
\value{
Un \code{data.frame} con columnas: \code{Estudiante}, \code{Nota} y \code{Estado}.
}
\examples{
# Generar 10 notas con 70\% aprobados
generar_notas(n = 10, porcentaje_aprobados = 0.7)
}
