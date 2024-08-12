library(logger)

log_file <- "logs/logfile"

log_appender(appender_file(log_file, max_lines = 10))

log_mean_calculation <- function(numbers) {
    if (!is.numeric(numbers)) {
        log_error("Le vecteur numbers : {numbers} contient des éléments non numériques.")
        mean_value <- NA
    } else if (length(numbers) == 0) {
        log_warn("Le vecteur numbers est vide")
        mean_value <- NA
    } else {
        log_info("Fonction appelée avec le vecteur de nombres suivants : {numbers}")
        mean_value <- mean(numbers)
        log_success("Le calcul de la moyenne est terminé. La valeur est : {mean_value}")
    }

    return(mean_value)
}


unlink(log_file)
