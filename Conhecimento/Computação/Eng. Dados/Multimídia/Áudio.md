Áudio é um vibração, uma **onda sonora**, que depende do meio para se propagar.

Entender as características da onda permitem criar mecanismos para reconhecimento, armazenamento e compressão de sons.

![[audio.png]]

##### Amplitude
É a distância entre um crista ou vale até o eixo central. É medida em metros.
No áudio, significa **volume** -> Quanto maior a amplitude, maior o volume

##### Frequência
É calculada usando o comprimento de onda (distância entre cristas ou entre vales) e a velocidade da onda.
Quanto menor a distância entre cristas ou entre vales, maior é a frequência.
No áudio, significa **altura** -> Quanto mais alto, mais agudo. Quanto mais baixo, mais grave.

> **Não confundir volume com altura. 

### Conversão analógico-digital
Para trabalhar com áudio, primeiro é necessário capturá-lo da fonte desejada e depois digitalizá-lo.

A primeira etapa consiste na transformação das ondas mecânicas em ondas elétricas (voltagens), tarefa realizada pelos microfones e piezos.

A próxima etapa envolve a extração de amostras. 
É necessário extrair "pedaços" do som em intervalos constantes de tempo, armazenando as amostras na forma binária.


![[audio_sampling.png]]

Entretanto, o modo como essas amostras são coletadas influencia na qualidade do áudio gerado.

- Muitas amostras: sinal muito parecido ao original
- Poucas amostras: sinal muito diferente do original

> Com infinitas amostras o sinal ficaria idêntico, mas isso não é viável!

Erros na amostragem podem gerar **aliasing**, ou seja, a distorção do sinal original com a criação de componentes que não estavam presentes nele.

Após a amostragem correta, os valores binários devem ser quantizados, e então estarão digitalizados.

O número de bits usado para representar a amostra também é crucial para definir a qualidade do áudio gerado.

Para definir a representação binária, as amostras de amplitude extraídas devem passar pela **quantização**.

![[audio_quant.png]]

> Número de amostras x Número de níveis -> compromisso

**Qual seria, então, o melhor número de bits para representar as amostras?**

Usar poucos bits faz com que amostras diferentes estejam no mesmo intervalo, o que gera erro -> O áudio estará perceptivelmente incorreto.

**Canais de som: 1 (mono), 2 (stereo), 3, 5, 7...**

**Taxas comuns de amostragem: 8000Hz (fala, telefone); 44.100Hz (músicas).**

**Bits por amostra: 8 (fala, telefone); 16 (músicas); 24 (músicas, com excelente qualidade, mas não diferente tanto de 16 bits)**

Após a conversão para binário, os dados devem ser armazenado de algum modo: formatos de áudio -> WAV, MP3...

> Quantos bytes são necessários para representar 1 segundo do áudio em qualidade de música?  $$1 * 44110 * 16 * 2 = 176400 \space bytes$$
> Leva em conta a taxa de amostragem, o número de bits por amostra e o número de canais

Em geral, esses processo são implementados em hardware, com circuitos ADC para conversão analógico -> digital (captura do áudio), e com circuitos DAC para o caminho inverso (reprodução do áudio).

Certos sistemas incluem [[Compressão de Áudio]] no processo de digitalização do sinal.

### Teorema de Nyquist
Desenvolvido por Shannon e Nyquist, o teorema mostra qual é a menor taxa de amostragem para sinais que obtenha um bom resultado.

A taxa deve ser, no mínimo, o dobro da maior frequência presente no sinal.
Essa é a **taxa de Nyquist**.

> Ex.: Maior frequência é 40 Hz. As amostras por segundo devem ser, no mínimo, 80.