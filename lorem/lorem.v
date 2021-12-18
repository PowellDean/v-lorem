module lorem

import rand

pub fn get_paragraph() string {
    return sentences(rand.int_in_range(3, 7))
}

pub fn get_sentence() string {
    return words(rand.int_in_range(3, 7)).capitalize()
}

pub fn get_word() string {
    words := get_wordlist()
    return words[rand.int_in_range(0, words.len)]
}

fn get_wordlist() []string {
    data := "alias consequatur aut perferendis sit voluptatem accusantium
doloremque aperiam, eaque ipsa quae ab illo inventore veritatis et quasi
architecto beatae vitae dicta sunt explicabo, aspernatur aut odit aut fugit
sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt
neque dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia
non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam
quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam
corporis Nemo enim ipsam voluptatem quia voluptas sit suscipit laboriosam, nisi
ut aliquid ex ea commodi consequatur Quis autem vel
eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae et
iusto odio dignissimos ducimus qui blanditiis praesentium laudantium, totam rem
voluptatum deleniti atque corrupti quos dolores et quas
molestias excepturi sint occaecati cupiditate non provident, Sed ut
perspiciatis unde omnis iste natus error similique sunt in culpa qui officia
deserunt mollitia animi, id est laborum et dolorum fuga Et harum quidem
rerum facilis est et expedita distinctio Nam libero tempore, cum soluta nobis
est eligendi optio cumque nihil impedit quo porro quisquam est, qui minus id
quod maxime placeat facere possimus, omnis voluptas assumenda
est, omnis dolor repellendus. Temporibus autem quibusdam et aut consequatur,
vel illum qui dolorem eum fugiat quo voluptas nulla pariatur at vero eos et
accusamus officiis debitis aut rerum necessitatibus saepe eveniet
ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum
rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores
doloribus asperiores repellat"
    return data.split_any(" \n")
}

pub fn sentences(count int) string {
    mut paragraph := []string{}
    for _ in 0 .. count {
        paragraph << get_sentence()
    }

    return paragraph.join(' ')
}

pub fn paragraphs(count int) string {
    mut thought := []string{}
    for _ in 0 .. count {
        thought << get_paragraph()
    }

    return thought.join('\n\n')
}

pub fn words(count int) string {
    mut words := []string{}
    for _ in 0 .. count {
        mut proposed := get_word()
        if proposed in words { proposed = get_word() }
        words << proposed
    }
    
    mut sentence := words.join(' ')
    sentence = sentence.trim_right(',') + '.'
    return sentence
}
