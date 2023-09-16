emptyLines            = 0
maxParagraphKeyLength = {}
filepath = "../../../digiriskdolibarr/langs/fr_FR/digiriskdolibarr.lang"

with open(filepath, "r") as langFile :
  for line in langFile:
    if "=" in line:
      splittedLine     = line.split('=', 1)
      formattedLineKey = splittedLine[0].replace(' ', '')
      if maxParagraphKeyLength.get(emptyLines) != None:
        if (maxParagraphKeyLength[emptyLines] < len(formattedLineKey)):
          maxParagraphKeyLength[emptyLines] = len(formattedLineKey)
      else:
          maxParagraphKeyLength[emptyLines] = len(formattedLineKey)
    else:
      emptyLines += 1
emptyLines = 0

with open('text.txt', 'x') as f:
    with open(filepath, "r") as langFile :
      for line in langFile:
        if "=" in line:
          splittedLine              = line.split('=', 1)
          formattedLineValue        = splittedLine[1].lstrip()
          formattedLineKey          = splittedLine[0].replace(' ', '')
          characterDifferenceNumber = abs(maxParagraphKeyLength[emptyLines] - len(formattedLineKey))
          for i in range(characterDifferenceNumber):
            formattedLineKey += ' '
          newLine = formattedLineKey + ' = ' + formattedLineValue
        else :
          emptyLines += 1
          newLine = line
        f.write(newLine)
