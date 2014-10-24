// GStrings
// http://groovy.codehaus.org/Strings+and+GString
foxtype = 'quick'
foxcolor = ['b', 'r', 'o', 'w', 'n']
println "The $foxtype ${foxcolor.join()} fox"
// => The quick brown fox

// Default access/visibility modifier is public
// http://groovy.codehaus.org/Groovy+style+and+language+feature+guidelines+for+Java+developers