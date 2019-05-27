
get.next.text <- function(input.text,trigrams_dt,bigrams_dt){
        
        best.text <- "unfound"
        tb_input.text <- as_tibble(input.text)
        names(tb_input.text) <- "text"
        uni.word.input <- tb_input.text %>%
                unnest_tokens(word, text)
        
        n.word.count <- dim(uni.word.input)[1] 
        
        last.two.word.input <- uni.word.input$word[c((n.word.count-1),n.word.count)]
        
        match.last.twoword.input <-subset(trigrams_dt,trigrams_dt$word2==last.two.word.input[2] & 
                                                  trigrams_dt$word1==last.two.word.input[1] )
        
        ### calculate the observed word prob in 3-grams
        if(length(match.last.twoword.input$word1) >=1){
                obs.trigram.prob <- match.last.twoword.input %>%
                        count(word1, word2, word3, sort = TRUE) %>%
                        mutate(prob =  (n/sum(n))) %>%
                        arrange(desc(n)) %>%
                        top_n(1)
                best.text <- obs.trigram.prob$word3[1]
        } ### end if any match
        
        ### calculate unobserved word based on 2-gram
        if(length(match.last.twoword.input$word1) ==0){
                match.bigram.last.word.input <- subset(bigrams_dt,bigrams_dt$word1==last.two.word.input[2])
                
                if(length(match.bigram.last.word.input$word1) >=1){
                        obs.bigram.prob <- match.bigram.last.word.input %>%
                                count(word1, word2, sort = TRUE) %>%
                                mutate(prob =  cumsum(n/sum(n))) %>%
                                arrange(desc(n)) %>%
                                top_n(1)
                        
                        best.text <- obs.bigram.prob$word2[1]
                } ### end if matching bigram
                
        } ### end if no match
        return(best.text)
}

### example
#input.text <- "In 1999, president Barack"
#get.next.text(input.text,trigrams_dt,bigrams_dt)

