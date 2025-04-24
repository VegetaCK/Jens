phrase = "Привет, попугай!"  # жестко заданное значение

while True:
    if phrase.lower() in ["выход", "exit", "quit"]:
        print("Пока")
        break

    print("Попугай сказал:", phrase)
