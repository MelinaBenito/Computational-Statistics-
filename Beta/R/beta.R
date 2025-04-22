#' Generador de notas por categoría (aprobado o desaprobado)
#'
#' @param n Total de notas a generar
#' @param porcentaje_aprobados Proporción de aprobados (entre 0 y 1)
#' @param semilla Valor inicial del generador (default = 123)
#'
#' @return Un data.frame con notas aleatorias clasificadas en aprobados y desaprobados
#' @export
generar_notas <- function(n, porcentaje_aprobados = 0.5, semilla = 123) {

  # Constantes para MCL
  a <- 1664525
  c <- 1013904223
  m <- 2^32
  x <- numeric(n)
  x[1] <- semilla

  for (i in 2:n) {
    x[i] <- (a * x[i - 1] + c) %% m
  }

  u <- x / m

  # Separar aprobados y desaprobados
  n_aprobados <- round(n * porcentaje_aprobados)
  n_desaprobados <- n - n_aprobados

  notas_aprobados <- u[1:n_aprobados] * (3000 - 1200.99) + 1200.99
  notas_desaprobados <- u[(n_aprobados + 1):n] * 1200.00

  notas <- c(notas_aprobados, notas_desaprobados)
  estados <- c(rep("Aprobado", n_aprobados), rep("Desaprobado", n_desaprobados))

  # notas  enteros y decimales
  tipo <- sample(c("entero", "decimal"), n, replace = TRUE)
  for (i in seq_along(notas)) {
    if (tipo[i] == "entero") {
      notas[i] <- round(notas[i])
    } else {
      notas[i] <- round(notas[i], 2)
    }
  }

  # tabla
  tabla_resultado <- data.frame(
    Estudiante = paste0("Est_", seq_len(n)),
    Nota = notas,
    Estado = estados
  )

  return(tabla_resultado)
}
set.seed(1)
resultado <- generar_notas(n = 100, porcentaje_aprobados = 0.6)
print(head(resultado, 100))  # Muestra los primeros 10 registros

