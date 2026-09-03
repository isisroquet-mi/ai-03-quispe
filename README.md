# Quispe y Xu (2026): Claude Code y la frontera de lenguajes

## 1. Pregunta

El paper pregunta si los asistentes de programación **agentic** —en particular Claude Code— expanden la frontera de producción de los desarrolladores de software.

La idea central no es solo que Claude Code aumente la productividad en lenguajes que el desarrollador ya conoce, sino que pueda permitirle producir en lenguajes que antes estaban fuera de su portafolio observado.

En términos simples, la pregunta es:

$$
\boxed{\text{¿Claude Code permite producir en más lenguajes?}}
$$

Más específicamente, el paper estudia si la adopción de Claude Code está asociada con:

- más lenguajes activos por mes;
- más lenguajes usados por primera vez;
- mayor diversidad del portafolio de lenguajes;
- mayor acumulación de lenguajes a lo largo del tiempo.

El objeto relevante no es una **frontera de habilidad**, sino una **frontera de producción**: el conjunto de lenguajes en los que el desarrollador logra producir código, sea trabajando solo, con asistencia conversacional o delegando parte de la ejecución a un agente.

## 2. Problema del agente

El desarrollador enfrenta oportunidades de producción en distintos lenguajes $k$. Para cada lenguaje, decide si le conviene producir o no.

El modelo compara tres modos de producción. Antes de Claude Code, el menú es:

$$
M^1=\{S,C\}
$$

donde:

- $S$: producción solo;
- $C$: asistencia conversacional.

Después de Claude Code, el menú se expande a:

$$
M^2=\{S,C,D\}
$$

donde:

- $D$: delegación agentic.

El desarrollador elige el modo que le da mayor excedente:

$$
V^g_{ik,t}=\max_{m\in M^g}V^m_{ik,t}
$$

El lenguaje se activa si el excedente máximo es no negativo:

$$
Z^g_{ik,t}=\mathbf{1}\left[V^g_{ik,t}\ge 0\right]
$$

El número de lenguajes observados en el mes es:

$$
N^g_{it}=\sum_k Z^g_{ik,t}
$$

### Producción solo

El excedente bajo producción solo es:

$$
V^S=\omega+s\mu-\frac{\rho s^2}{2\pi}-b
$$

El lenguaje se usa si:

$$
V^S\ge 0
$$

Despejando:

$$
\omega+s\mu-\frac{\rho s^2}{2\pi}-b\ge 0
$$

$$
\omega\ge b-s\mu+\frac{\rho s^2}{2\pi}
$$

Entonces el umbral de entrada bajo producción solo es:

$$
\boxed{T^S=b-s\mu+\frac{\rho s^2}{2\pi}}
$$

y se cumple:

$$
V^S\ge 0\Longleftrightarrow \omega\ge T^S
$$

### Asistencia conversacional

La IA conversacional agrega un beneficio proporcional a la habilidad existente:

$$
V^C=V^S+\gamma s-r_C
$$

Por tanto, su umbral es:

$$
T^C=T^S-(\gamma s-r_C)
$$

Antes de Claude Code, el umbral efectivo es:

$$
T^1=\min\{T^S,T^C\}
$$

Como:

$$
T^C=T^S-(\gamma s-r_C)
$$

entonces:

$$
T^1=T^S-\max\{0,\gamma s-r_C\}
$$

Para lenguajes desconocidos, el paper asume:

$$
\gamma s-r_C\le 0
$$

Es decir, la IA conversacional no reduce el umbral de entrada si el desarrollador no tiene una base previa en ese lenguaje. Por tanto:

$$
\boxed{T^1=T^S}
$$

### Delegación agentic con Claude Code

Claude Code introduce un nuevo modo de producción: la delegación.

El excedente bajo delegación es:

$$
V^D=
\omega
+(1-\lambda)s\mu
+\lambda az(A)
-\kappa(a,s)
-r_D
-b
-\frac{\rho}{2}
\left[
(1-\lambda)^2\frac{s^2}{\pi}
+\sigma_D^2(a,s,A)
\right]
$$

El lenguaje se activa si:

$$
V^D\ge 0
$$

Despejando $\omega$, se obtiene el umbral de delegación:

$$
\boxed{
T^D=
b
-(1-\lambda)s\mu
-\lambda az(A)
+\kappa(a,s)
+r_D
+\frac{\rho}{2}
\left[
(1-\lambda)^2\frac{s^2}{\pi}
+\sigma_D^2(a,s,A)
\right]
}
$$

Entonces:

$$
V^D\ge 0\Longleftrightarrow \omega\ge T^D
$$

Después de Claude Code, el umbral efectivo es:

$$
T^2=\min\{T^1,T^D\}
$$

Como el desarrollador siempre puede ignorar Claude Code, el nuevo menú no puede empeorar sus opciones dentro del modelo:

$$
\boxed{T^2\le T^1}
$$

## 3. Resultado principal

El resultado principal del modelo es que Claude Code puede expandir el número esperado de lenguajes observados si la delegación reduce el umbral de entrada a lenguajes desconocidos.

Para lenguajes desconocidos, ya se tiene:

$$
T^1=T^S
$$

El paper define la reducción del umbral por delegación como:

$$
B\equiv T^1-T^D
$$

Como $T^1=T^S$, entonces:

$$
B=T^S-T^D
$$

Sustituyendo:

$$
T^S=b-s\mu+\frac{\rho s^2}{2\pi}
$$

y

$$
T^D=
b
-(1-\lambda)s\mu
-\lambda az(A)
+\kappa(a,s)
+r_D
+\frac{\rho}{2}
\left[
(1-\lambda)^2\frac{s^2}{\pi}
+\sigma_D^2(a,s,A)
\right]
$$

se obtiene:

$$
\begin{aligned}
B
&=
\left(
b-s\mu+\frac{\rho s^2}{2\pi}
\right)
-\Bigg[
b
-(1-\lambda)s\mu
-\lambda az(A)
+\kappa(a,s)
+r_D \\
&\qquad\qquad+
\frac{\rho}{2}
\left[
(1-\lambda)^2\frac{s^2}{\pi}
+\sigma_D^2(a,s,A)
\right]
\Bigg]
\end{aligned}
$$

Distribuyendo el signo negativo:

$$
\begin{aligned}
B
&=
b-s\mu+\frac{\rho s^2}{2\pi}
-b
+(1-\lambda)s\mu
+\lambda az(A)
-\kappa(a,s)
-r_D \\
&\quad
-\frac{\rho}{2}
\left[
(1-\lambda)^2\frac{s^2}{\pi}
+\sigma_D^2(a,s,A)
\right]
\end{aligned}
$$

Cancelando $b-b=0$:

$$
\begin{aligned}
B
&=
-s\mu
+(1-\lambda)s\mu
+\lambda az(A)
-\kappa(a,s)
-r_D \\
&\quad
+\frac{\rho s^2}{2\pi}
-\frac{\rho}{2}
\left[
(1-\lambda)^2\frac{s^2}{\pi}
+\sigma_D^2(a,s,A)
\right]
\end{aligned}
$$

Simplificando los términos con $s\mu$:

$$
-s\mu+(1-\lambda)s\mu=-\lambda s\mu
$$

Simplificando los términos de riesgo:

$$
\frac{\rho s^2}{2\pi}
- \frac{\rho}{2}(1-\lambda)^2\frac{s^2}{\pi}
= \frac{\rho}{2}
\left[
1-(1-\lambda)^2
\right]
\frac{s^2}{\pi}
$$

Como:

$$
1-(1-\lambda)^2
= 1-(1-2\lambda+\lambda^2)
= 2\lambda-\lambda^2
$$

entonces:

$$
\boxed{
B=
\lambda\left[az(A)-s\mu\right]
-\kappa(a,s)
-r_D
+\frac{\rho}{2}
\left[
(2\lambda-\lambda^2)\frac{s^2}{\pi}
-\sigma_D^2(a,s,A)
\right]
}
$$

Si:

$$
B>0
$$

entonces:

$$
T^S-T^D>0
$$

por tanto:

$$
\boxed{T^D \lt T^S}
$$

Esto significa que Claude Code reduce el umbral de entrada para ese lenguaje desconocido.

El cambio en la activación de un lenguaje es:

$$
Z^2-Z^1=
\mathbf{1}
\left[
T^D\le \omega\lt T^S
\right]
$$

Este intervalo es la **banda de activación**:

$$
\boxed{T^D\le \omega\ltT^S}
$$

Interpretación:

- Si $\omega\ltT^D$, el lenguaje no se usa ni siquiera con Claude Code.
- Si $\omega\ge T^S$, el lenguaje ya era rentable sin Claude Code.
- Si $T^D\le \omega\ltT^S$, el lenguaje solo se vuelve viable gracias a la delegación agentic.

Sumando sobre lenguajes:

$$
N^2-N^1=\sum_k (Z^2_k-Z^1_k)
$$

Tomando esperanza:

$$
\mathbb{E}[N^2-N^1]
= \sum_k \mathbb{E}[Z^2_k-Z^1_k]
$$

Como:

$$
Z^g_k=\mathbf{1}[\omega_k\ge T^g_k]
$$

entonces:

$$
\mathbb{E}[Z^g_k]
= \Pr(\omega_k\ge T^g_k)
= 1-F_k(T^g_k)
$$

Por tanto:

$$
\begin{aligned}
\mathbb{E}[Z^2_k-Z^1_k]
&=
[1-F_k(T^2_k)]-[1-F_k(T^1_k)]\\
&=
F_k(T^1_k)-F_k(T^2_k)
\end{aligned}
$$

Finalmente:

$$
\boxed{
\mathbb{E}[N^2-N^1]
= \sum_k
\left[
F_k(T^1_k)-F_k(T^2_k)
\right]
\ge 0
}
$$

Para lenguajes desconocidos activados por Claude Code:

$$
\boxed{
\mathbb{E}[N^2-N^1]
= \sum_{k\in U_i}
\left[
F_k(T^S_k)-F_k(T^D_k)
\right]
\ge 0
}
$$

La cadena completa del modelo es:

$$
\boxed{
\begin{gathered}
\text{Código Claude}
\Longrightarrow
T^D\ltT^S
\Longrightarrow
Z^2-Z^1
=\mathbf{1}\left[T^D\le \omega\ltT^S\right]
\Longrightarrow
\mathbb{E}[N^2-N^1]\ge 0
\end{gathered}
}
$$

## 4. Condiciones

El resultado depende de varias condiciones importantes.

### Condición 1: la IA conversacional no mueve el umbral en lenguajes desconocidos

Para lenguajes desconocidos, el paper requiere:

$$
\gamma s-r_C\le 0
$$

Esto implica:

$$
T^1=T^S
$$

La interpretación es que ChatGPT, Copilot u otra IA conversacional ayudan sobre todo cuando el desarrollador ya tiene una base en el lenguaje. Si el lenguaje es desconocido, la asistencia conversacional no basta para reducir el umbral de entrada.

### Condición 2: la delegación debe reducir el umbral

La condición central es:

$$
B>0
$$

Esto equivale a:

$$
T^D\ltT^S
$$

En términos económicos, la delegación debe generar beneficios netos mayores que sus costos.

La expresión de $B$ muestra que esto depende de:

$$
\lambda\left[az(A)-s\mu\right]
$$

como ganancia esperada por sustitución de ejecución humana por ejecución agentic;

$$
-\kappa(a,s)-r_D
$$

como costos de verificación y uso de la delegación;

y

$$
\frac{\rho}{2}
\left[
(2\lambda-\lambda^2)\frac{s^2}{\pi}
-\sigma_D^2(a,s,A)
\right]
$$

como efecto neto sobre el riesgo.

Por tanto, Claude Code reduce el umbral solo si la ganancia por delegar y la reducción de riesgo compensan los costos de verificar, dirigir y usar el agente.

### Condición 3: la oportunidad debe caer dentro de la banda de activación

No basta con que $T^D\ltT^S$. Para que el lenguaje nuevo efectivamente se observe, la oportunidad $\omega$ debe estar en el intervalo:

$$
T^D\le \omega\ltT^S
$$

Ese es el conjunto de oportunidades que antes no eran rentables y que ahora sí lo son.

### Condición 4: la distribución de oportunidades debe asignar masa a esa banda

El aumento esperado en lenguajes depende de:

$$
F_k(T^S_k)-F_k(T^D_k)
$$

Si no hay oportunidades en ese intervalo, la banda existe formalmente, pero no genera nuevos lenguajes observados.

## 5. Crítica: vulnerabilidad causal del modelo

La principal debilidad no está en la derivación algebraica. Si se aceptan los supuestos del modelo, el resultado es coherente:

$$
B>0
\Longrightarrow
T^D\ltT^S
\Longrightarrow
\mathbb{E}[N^2-N^1]\ge0
$$

La vulnerabilidad está en el primer supuesto económico, que puede expresarse así:

$$
\boxed{
\text{Claude Code}
\Longrightarrow
\Delta>0
}
$$

donde $\Delta$ representa la reducción efectiva del costo o del umbral de entrada gracias a la delegación.

En el lenguaje del modelo, esa idea aparece como:

$$
B=T^S-T^D>0
$$

Es decir, el paper necesita que Claude Code reduzca el umbral:

$$
T^D\ltT^S
$$

Pero ese paso no es observado directamente en los datos. El paper no observa $\Delta$, ni observa directamente cuánto cayó el costo de producir en un lenguaje desconocido. Tampoco observa perfectamente cuánto trabajo fue delegado al agente, cuánto verificó el humano o si el desarrollador ya tenía planeado entrar a ese lenguaje.

La evidencia empírica muestra algo más limitado:

$$
\boxed{
\text{Claude Code}
\Longrightarrow
\text{más lenguajes observados}
}
$$

Es decir, alrededor de la adopción de Claude Code se observa un aumento en lenguajes activos, lenguajes nuevos y diversidad del portafolio. Ese patrón es consistente con el modelo, pero no prueba por sí solo que el mecanismo causal sea la reducción del costo por delegación.

La vulnerabilidad es que existe una explicación alternativa:

$$
\boxed{
\text{Nuevo proyecto en lenguaje desconocido}
\Longrightarrow
\text{adopción de Claude Code}
\Longrightarrow
\text{más lenguajes observados}
}
$$

Por ejemplo, un desarrollador podría decidir iniciar un proyecto en Rust. Como Rust le resulta difícil, instala Claude Code para ayudarse. En ese caso, el nuevo lenguaje no aparece porque Claude Code redujo exógenamente el umbral de entrada, sino porque el proyecto ya había cambiado antes de la adopción. Claude Code sería una respuesta al nuevo proyecto, no necesariamente la causa de la expansión del portafolio.

Por eso, la diferencia clave es:

$$
\boxed{
\text{Derivación matemática correcta}
\neq
\text{identificación causal convincente}
}
$$

La derivación demuestra una implicación condicional:

$$
\boxed{
\Delta>0
\Longrightarrow
\text{más lenguajes observados en esperanza}
}
$$

pero no demuestra empíricamente que:

$$
\boxed{
\text{Claude Code}
\Longrightarrow
\Delta>0
}
$$

El paper reconoce esta limitación: la adopción es voluntaria y puede coincidir con shocks de proyectos. Por eso, aunque los resultados son consistentes con el mecanismo de delegación agentic, la interpretación más prudente es asociacional, no causal definitiva. Para cerrar esta vulnerabilidad haría falta variación exógena en la adopción de Claude Code, como cambios de precios, reglas de elegibilidad, despliegues institucionales o algún diseño que permita separar la decisión de adoptar Claude Code de la decisión previa de empezar proyectos en nuevos lenguajes.
