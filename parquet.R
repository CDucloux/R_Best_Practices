library(arrow)
library(dplyr)

df <- data.frame(
    id = 1:5,
    name = c("Alice", "Bob", "Eva", "David", "Eva"),
    score = c(85, 90, 89, 92, 2)
)

write_parquet(df, "small_dataset.parquet")

read_parquet("small_dataset.parquet")

read_parquet("small_dataset.parquet", col_select = c("id", "score"))

open_dataset("small_dataset.parquet")

query <- open_dataset("small_dataset.parquet") |>
    filter(score < 90) |>
    group_by(name) |>
    summarise(total_score = sum(score)) |>
    arrange(total_score)

query |> collect()
