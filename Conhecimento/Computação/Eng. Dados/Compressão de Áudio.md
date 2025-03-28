Áudio é uma vibração, uma onda mecânica.

As características da onda são essenciais para manipular o áudio.
Limitações humanas não permitem ouvir todo o tipo de som.

##### Amplitude
Amplitude = Intensidade: é o volume do som (mais intensidade, mais alto).
A amplitude é metida em decibéis (uma escala logarítmica)

##### Frequência
Determina a altura do som, ou seja, agudos e graves (frequência alta, som agudo).
A frequência é medida em Hertz.

É possível descartar determinadas faixas de áudio, que não são de interesse para o programa. 

>Exemplo: É muito comum descartar faixas de áudio não perceptíveis para humanos, já que não iremos ouvi-los.

### Áudio digital
As ondas captadas (via microfone, por exemplo) são processadas e transformadas em ondas eletrônicas e posteriormente em bits.

É necessário separar as frequências de áudio (alta e baixa), e para isso usa-se a [[Transformada de Fourier]].

Para construir o sinal em binário, é necessário separar amostras da onda em determinados intervalos.
Mas, qual o tamanho do intervalo? Intervalos pequenos distorcem muito o resultado. Intervalos muitos pequenos tendem ao infinito...

#### Teorema de Nyquist
Mostra que para representar fielmente um sinal em binário precisamos de uma taxa mínima de intervalos maior ou equivalente ao **dobro da componente de mais alta frequência**.

> Usar amostragem abaixo da Taxa de Nyquist gera **aliasing**.

> Exemplo: Uma onda cuja maior frequência é 40 Hz. As amostras por segundo devem ser, no mínimo, 80. -> 80 amostras / segundos.


### Quantização
Processo responsável por tornar o áudio eletrônico em digital, após a identificação das taxas pelo teorema de Nyquist.
Determina a quantidade de bits usadas e os intervalos gerados.

Usar poucos bits faz com que amostras diferentes estejam no mesmo intervalo, o que gera erro -> O áudio estará perceptivelmente incorreto.

Canais de som: 1 (mono), 2 (stereo), 3, 5, 7...

> Taxas comuns de amostragem: 8000Hz (fala, telefone); 44.100Hz (músicas).

>Bits por amostra: 8 (fala, telefone); 16 (músicas); 24 (músicas, com excelente qualidade, mas não diferente tanto de 16 bits)


O processo de conversão do áudio são implementados em hardware.

Áudio pode ser armazenado em WAV, MP3...




