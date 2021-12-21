module lorem

import rand

// get_paragraph creates a full paragraph of nonsense text by stringing
// together between 3 and 7 sentences
fn get_paragraph() string {
    return sentences(rand.int_in_range(3, 7))
}

// get_sentence creates a new sentence of nonsense text by stringing together
// between 3 and 7 words
fn get_sentence() string {
    mut sentence := words(rand.int_in_range(3, 7)).capitalize()
    sentence = sentence.trim_right(',') + '.'
    return sentence
}

// get_word selects a single random word from the wordlist
fn get_word() string {
    words := get_wordlist()
    return words[rand.int_in_range(0, words.len)]
}

// get_wordlist breaks the given data string into individual words and returns
// the entire list in an array. Words are defined as any string of characters
// delimited by spaces, newlines, or tabs
fn get_wordlist() []string {
    data := "alias consequatur aut perferendis sit voluptatem accusantium
doloremque aperiam, eaque ipsa quae ab illo inventore veritatis et quasi
architecto beatae vitae dicta sunt explicabo, aspernatur aut odit aut fugit
sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt
neque dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia
non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam
quaerat voluptatem. ut enim ad minima veniam, quis nostrum exercitationem ullam
corporis Nemo enim ipsam voluptatem quia voluptas sit suscipit laboriosam, nisi
ut aliquid ex ea commodi consequatur quis autem vel
eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae et
iusto odio dignissimos ducimus qui blanditiis praesentium laudantium, totam rem
voluptatum deleniti atque corrupti quos dolores et quas
molestias excepturi sint occaecati cupiditate non provident, sed ut
perspiciatis unde omnis iste natus error similique sunt in culpa qui officia
deserunt mollitia animi, id est laborum et dolorum fuga et harum quidem
rerum facilis est et expedita distinctio nam libero tempore, cum soluta nobis
est eligendi optio cumque nihil impedit quo porro quisquam est, qui minus id
quod maxime placeat facere possimus, omnis voluptas assumenda
est, omnis dolor repellendus. Temporibus autem quibusdam et aut consequatur,
vel illum qui dolorem eum fugiat quo voluptas nulla pariatur at vero eos et
accusamus officiis debitis aut rerum necessitatibus saepe eveniet
ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum
rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores
doloribus asperiores repellat"
    return data.split_any(" \n\t")
}

pub fn paragraphs(count int) string {
    mut thought := []string{}
    for _ in 0 .. count {
        thought << get_paragraph()
    }

    return thought.join('\n\n')
}

// sentences will create the requested number of nonsense sentences. For this
// release, we aren't capping the maximum number of sentences.
pub fn sentences(count int) string {
    mut paragraph := []string{}
    for _ in 0 .. count {
        paragraph << get_sentence()
    }

    return paragraph.join(' ')
}

// words will generate the requested number of random words. For the current
// release we aren't capping the number of words we can generate. At the end
// of the string of words, we append a period (.)
pub fn words(count int) string {
    mut words := []string{}
    for _ in 0 .. count {
        mut proposed := get_word()
        if proposed in words { proposed = get_word() }
        words << proposed
    }
    
    //mut sentence := words.join(' ')
    //sentence = sentence.trim_right(',') + '.'
    //return sentence
    return words.join(' ')
}
