# 원본 코드

- https://github.com/bfut/ReaScripts

# 작동 방식

## copyPitches

- 선택한 MediaItem들의 피치값을 클립보드에 복사한다.
- 이때 =rP\*1>라는 값을 추가하여 유효성 식별에 사용한다.

## pastePitches

- 클립보드값을 가져온다
- 클립보드값 마지막에 =rP\*1>이 붙어있는지 확인하여 유효성을 검사한다.
- 가져온 클립보드값(문자열)을 ,을 기준으로 나눈다.
- 선택한 MediaItem들의 피치값들을 대응되는 클립보드값으로 바꾼다.
- MediaItem의 인덱스가 복사한 피치값의 수보다 많을 때 for문에서 나간다.
