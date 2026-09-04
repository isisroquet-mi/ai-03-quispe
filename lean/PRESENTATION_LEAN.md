# Diapositiva Lean recomendada

## De la ecuación del paper a una banda verificada

**Ecuación matemática**

\[
T^D < T^S
\quad\Longrightarrow\quad
\bigl(Z^2-Z^1=1\bigr)
\Longleftrightarrow
T^D\leq \omega < T^S.
\]

**Declaración Lean y paso de prueba clave**

```lean
def activationBandSpec (opportunity preThreshold agentThreshold : ℝ) : Prop :=
  agentThreshold < preThreshold →
    (Active opportunity (postThreshold preThreshold agentThreshold) ∧
        ¬ Active opportunity preThreshold ↔
      agentThreshold ≤ opportunity ∧ opportunity < preThreshold)

theorem activation_band
    (opportunity preThreshold agentThreshold : ℝ) :
    activationBandSpec opportunity preThreshold agentThreshold := by
  intro hLower
  unfold Active postThreshold
  rw [min_eq_right (le_of_lt hLower)]
  simp only [not_le]
```

**Interpretación**

- `postThreshold = min T^S T^D`; bajo `T^D < T^S`, Lean lo reescribe como `T^D`.
- `Active ω T` significa `T ≤ ω`.
- No estar activo antes significa `¬(T^S ≤ ω)`, que Lean convierte exactamente en `ω < T^S`.
- Resultado de elaboración: **0 errores y 0 mensajes** en la superficie probada.
- Límite honesto: Lean verifica la implicación matemática condicional; no demuestra que Claude Code cause `T^D < T^S` en los datos.
