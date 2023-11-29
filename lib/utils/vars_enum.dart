enum NewsType {
  topTrending,
  allNews,
}

enum SortByEnum {
  /// articles more closely related to q come first
  relevancy,

  /// articles from popular sources and publishers come first
  popularity,

  /// newest articles come first
  publishedAt,
}
