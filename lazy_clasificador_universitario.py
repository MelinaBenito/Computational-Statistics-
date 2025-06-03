
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from lazypredict.Supervised import LazyClassifier
import warnings
warnings.filterwarnings("ignore")

# Dataset universitario simulado
data = {
    'Horas_Estudio': [1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 13, 14, 15],
    'Asistencia_Clases': [5, 10, 8, 12, 14, 15, 18, 20, 22, 24, 27, 28, 30],
    'Aprobado': [0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1]
}

df = pd.DataFrame(data)

# Variables independientes y variable dependiente
X = df[['Horas_Estudio', 'Asistencia_Clases']]
y = df['Aprobado']

# División en entrenamiento y prueba
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

# LazyClassifier para clasificación
clf = LazyClassifier(verbose=0, ignore_warnings=True, custom_metric=None)
modelos, predicciones = clf.fit(X_train, X_test, y_train, y_test)

# Mostrar resultados
print("Comparación de modelos de clasificación:")
print(modelos)
