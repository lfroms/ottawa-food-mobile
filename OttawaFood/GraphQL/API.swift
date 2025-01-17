// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public enum BucketListItemStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// 0
  case pending
  /// 1
  case liked
  /// 2
  case disliked
  /// 3
  case neutral
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "pending": self = .pending
      case "liked": self = .liked
      case "disliked": self = .disliked
      case "neutral": self = .neutral
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .pending: return "pending"
      case .liked: return "liked"
      case .disliked: return "disliked"
      case .neutral: return "neutral"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: BucketListItemStatus, rhs: BucketListItemStatus) -> Bool {
    switch (lhs, rhs) {
      case (.pending, .pending): return true
      case (.liked, .liked): return true
      case (.disliked, .disliked): return true
      case (.neutral, .neutral): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [BucketListItemStatus] {
    return [
      .pending,
      .liked,
      .disliked,
      .neutral,
    ]
  }
}

public final class CurrentUserQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query CurrentUser {
      currentUser {
        __typename
        recommendations(first: 20) {
          __typename
          nodes {
            __typename
            index
            restaurant {
              __typename
              id
              yelpId
              name
              imageUrl
            }
          }
        }
        favoriteRestaurants {
          __typename
          nodes {
            __typename
            id
            yelpId
            name
            imageUrl
          }
        }
        bucketListItems {
          __typename
          nodes {
            __typename
            restaurant {
              __typename
              id
              yelpId
              name
              imageUrl
            }
          }
        }
      }
    }
    """

  public let operationName: String = "CurrentUser"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("currentUser", type: .object(CurrentUser.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(currentUser: CurrentUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "currentUser": currentUser.flatMap { (value: CurrentUser) -> ResultMap in value.resultMap }])
    }

    /// Specific details about the current user.
    public var currentUser: CurrentUser? {
      get {
        return (resultMap["currentUser"] as? ResultMap).flatMap { CurrentUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "currentUser")
      }
    }

    public struct CurrentUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("recommendations", arguments: ["first": 20], type: .nonNull(.object(Recommendation.selections))),
        GraphQLField("favoriteRestaurants", type: .nonNull(.object(FavoriteRestaurant.selections))),
        GraphQLField("bucketListItems", type: .nonNull(.object(BucketListItem.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(recommendations: Recommendation, favoriteRestaurants: FavoriteRestaurant, bucketListItems: BucketListItem) {
        self.init(unsafeResultMap: ["__typename": "User", "recommendations": recommendations.resultMap, "favoriteRestaurants": favoriteRestaurants.resultMap, "bucketListItems": bucketListItems.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var recommendations: Recommendation {
        get {
          return Recommendation(unsafeResultMap: resultMap["recommendations"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "recommendations")
        }
      }

      public var favoriteRestaurants: FavoriteRestaurant {
        get {
          return FavoriteRestaurant(unsafeResultMap: resultMap["favoriteRestaurants"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "favoriteRestaurants")
        }
      }

      public var bucketListItems: BucketListItem {
        get {
          return BucketListItem(unsafeResultMap: resultMap["bucketListItems"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "bucketListItems")
        }
      }

      public struct Recommendation: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["RecommendationConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nodes", type: .list(.object(Node.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nodes: [Node?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "RecommendationConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of nodes.
        public var nodes: [Node?]? {
          get {
            return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Recommendation"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("index", type: .nonNull(.scalar(Int.self))),
            GraphQLField("restaurant", type: .nonNull(.object(Restaurant.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(index: Int, restaurant: Restaurant) {
            self.init(unsafeResultMap: ["__typename": "Recommendation", "index": index, "restaurant": restaurant.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var index: Int {
            get {
              return resultMap["index"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "index")
            }
          }

          public var restaurant: Restaurant {
            get {
              return Restaurant(unsafeResultMap: resultMap["restaurant"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "restaurant")
            }
          }

          public struct Restaurant: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Restaurant"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("yelpId", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("imageUrl", type: .scalar(String.self)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, yelpId: String, name: String? = nil, imageUrl: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Restaurant", "id": id, "yelpId": yelpId, "name": name, "imageUrl": imageUrl])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var yelpId: String {
              get {
                return resultMap["yelpId"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "yelpId")
              }
            }

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var imageUrl: String? {
              get {
                return resultMap["imageUrl"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "imageUrl")
              }
            }
          }
        }
      }

      public struct FavoriteRestaurant: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["RestaurantConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nodes", type: .list(.object(Node.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nodes: [Node?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "RestaurantConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of nodes.
        public var nodes: [Node?]? {
          get {
            return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Restaurant"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("yelpId", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("imageUrl", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, yelpId: String, name: String? = nil, imageUrl: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Restaurant", "id": id, "yelpId": yelpId, "name": name, "imageUrl": imageUrl])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var yelpId: String {
            get {
              return resultMap["yelpId"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "yelpId")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var imageUrl: String? {
            get {
              return resultMap["imageUrl"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "imageUrl")
            }
          }
        }
      }

      public struct BucketListItem: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["BucketListItemConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nodes", type: .list(.object(Node.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nodes: [Node?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "BucketListItemConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of nodes.
        public var nodes: [Node?]? {
          get {
            return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["BucketListItem"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("restaurant", type: .nonNull(.object(Restaurant.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(restaurant: Restaurant) {
            self.init(unsafeResultMap: ["__typename": "BucketListItem", "restaurant": restaurant.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var restaurant: Restaurant {
            get {
              return Restaurant(unsafeResultMap: resultMap["restaurant"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "restaurant")
            }
          }

          public struct Restaurant: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Restaurant"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("yelpId", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("imageUrl", type: .scalar(String.self)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, yelpId: String, name: String? = nil, imageUrl: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Restaurant", "id": id, "yelpId": yelpId, "name": name, "imageUrl": imageUrl])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var yelpId: String {
              get {
                return resultMap["yelpId"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "yelpId")
              }
            }

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var imageUrl: String? {
              get {
                return resultMap["imageUrl"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "imageUrl")
              }
            }
          }
        }
      }
    }
  }
}

public final class OttawaFavoritesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query OttawaFavorites {
      ottawaFavorites(first: 15) {
        __typename
        nodes {
          __typename
          id
          index
          restaurant {
            __typename
            id
            yelpId
            name
            imageUrl
          }
        }
      }
    }
    """

  public let operationName: String = "OttawaFavorites"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("ottawaFavorites", arguments: ["first": 15], type: .nonNull(.object(OttawaFavorite.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(ottawaFavorites: OttawaFavorite) {
      self.init(unsafeResultMap: ["__typename": "Query", "ottawaFavorites": ottawaFavorites.resultMap])
    }

    /// Ordered list of Ottawa's top favorite restaurants.
    public var ottawaFavorites: OttawaFavorite {
      get {
        return OttawaFavorite(unsafeResultMap: resultMap["ottawaFavorites"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "ottawaFavorites")
      }
    }

    public struct OttawaFavorite: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["OttawaFavoriteConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("nodes", type: .list(.object(Node.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(nodes: [Node?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "OttawaFavoriteConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of nodes.
      public var nodes: [Node?]? {
        get {
          return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
        }
      }

      public struct Node: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["OttawaFavorite"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("index", type: .nonNull(.scalar(Int.self))),
          GraphQLField("restaurant", type: .nonNull(.object(Restaurant.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, index: Int, restaurant: Restaurant) {
          self.init(unsafeResultMap: ["__typename": "OttawaFavorite", "id": id, "index": index, "restaurant": restaurant.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var index: Int {
          get {
            return resultMap["index"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "index")
          }
        }

        public var restaurant: Restaurant {
          get {
            return Restaurant(unsafeResultMap: resultMap["restaurant"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "restaurant")
          }
        }

        public struct Restaurant: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Restaurant"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("yelpId", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("imageUrl", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, yelpId: String, name: String? = nil, imageUrl: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Restaurant", "id": id, "yelpId": yelpId, "name": name, "imageUrl": imageUrl])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var yelpId: String {
            get {
              return resultMap["yelpId"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "yelpId")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var imageUrl: String? {
            get {
              return resultMap["imageUrl"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "imageUrl")
            }
          }
        }
      }
    }
  }
}

public final class TrendingQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Trending {
      trendingRestaurants(first: 15) {
        __typename
        nodes {
          __typename
          id
          index
          restaurant {
            __typename
            id
            yelpId
            name
            imageUrl
          }
        }
      }
    }
    """

  public let operationName: String = "Trending"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("trendingRestaurants", arguments: ["first": 15], type: .nonNull(.object(TrendingRestaurant.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(trendingRestaurants: TrendingRestaurant) {
      self.init(unsafeResultMap: ["__typename": "Query", "trendingRestaurants": trendingRestaurants.resultMap])
    }

    /// Ordered list of currently trending restaurants.
    public var trendingRestaurants: TrendingRestaurant {
      get {
        return TrendingRestaurant(unsafeResultMap: resultMap["trendingRestaurants"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "trendingRestaurants")
      }
    }

    public struct TrendingRestaurant: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["TrendingRestaurantConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("nodes", type: .list(.object(Node.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(nodes: [Node?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "TrendingRestaurantConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of nodes.
      public var nodes: [Node?]? {
        get {
          return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
        }
      }

      public struct Node: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["TrendingRestaurant"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("index", type: .nonNull(.scalar(Int.self))),
          GraphQLField("restaurant", type: .nonNull(.object(Restaurant.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, index: Int, restaurant: Restaurant) {
          self.init(unsafeResultMap: ["__typename": "TrendingRestaurant", "id": id, "index": index, "restaurant": restaurant.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var index: Int {
          get {
            return resultMap["index"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "index")
          }
        }

        public var restaurant: Restaurant {
          get {
            return Restaurant(unsafeResultMap: resultMap["restaurant"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "restaurant")
          }
        }

        public struct Restaurant: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Restaurant"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("yelpId", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("imageUrl", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, yelpId: String, name: String? = nil, imageUrl: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Restaurant", "id": id, "yelpId": yelpId, "name": name, "imageUrl": imageUrl])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var yelpId: String {
            get {
              return resultMap["yelpId"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "yelpId")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var imageUrl: String? {
            get {
              return resultMap["imageUrl"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "imageUrl")
            }
          }
        }
      }
    }
  }
}

public final class ValidateAppleIdMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation ValidateAppleID($name: String!, $token: String!) {
      validateAppleId(input: {name: $name, token: $token}) {
        __typename
        token
      }
    }
    """

  public let operationName: String = "ValidateAppleID"

  public var name: String
  public var token: String

  public init(name: String, token: String) {
    self.name = name
    self.token = token
  }

  public var variables: GraphQLMap? {
    return ["name": name, "token": token]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("validateAppleId", arguments: ["input": ["name": GraphQLVariable("name"), "token": GraphQLVariable("token")]], type: .object(ValidateAppleId.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(validateAppleId: ValidateAppleId? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "validateAppleId": validateAppleId.flatMap { (value: ValidateAppleId) -> ResultMap in value.resultMap }])
    }

    /// Validates an Apple ID JWT and returns an app JWT for authentication purposes.
    public var validateAppleId: ValidateAppleId? {
      get {
        return (resultMap["validateAppleId"] as? ResultMap).flatMap { ValidateAppleId(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "validateAppleId")
      }
    }

    public struct ValidateAppleId: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ValidateAppleIdPayload"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("token", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "ValidateAppleIdPayload", "token": token])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String? {
        get {
          return resultMap["token"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }
    }
  }
}

public final class SearchQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Search($query: String!) {
      search(query: $query) {
        __typename
        yelpId
        name
        address
      }
    }
    """

  public let operationName: String = "Search"

  public var query: String

  public init(query: String) {
    self.query = query
  }

  public var variables: GraphQLMap? {
    return ["query": query]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("search", arguments: ["query": GraphQLVariable("query")], type: .nonNull(.list(.nonNull(.object(Search.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(search: [Search]) {
      self.init(unsafeResultMap: ["__typename": "Query", "search": search.map { (value: Search) -> ResultMap in value.resultMap }])
    }

    /// Search for restaurants.
    public var search: [Search] {
      get {
        return (resultMap["search"] as! [ResultMap]).map { (value: ResultMap) -> Search in Search(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Search) -> ResultMap in value.resultMap }, forKey: "search")
      }
    }

    public struct Search: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["YelpSearchResult"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("yelpId", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("address", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(yelpId: String, name: String, address: String) {
        self.init(unsafeResultMap: ["__typename": "YelpSearchResult", "yelpId": yelpId, "name": name, "address": address])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var yelpId: String {
        get {
          return resultMap["yelpId"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "yelpId")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var address: String {
        get {
          return resultMap["address"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "address")
        }
      }
    }
  }
}

public final class CreateBucketListItemMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateBucketListItem($yelpId: ID!) {
      createBucketListItem(input: {yelpId: $yelpId}) {
        __typename
        bucketListItem {
          __typename
          id
          status
        }
      }
    }
    """

  public let operationName: String = "CreateBucketListItem"

  public var yelpId: GraphQLID

  public init(yelpId: GraphQLID) {
    self.yelpId = yelpId
  }

  public var variables: GraphQLMap? {
    return ["yelpId": yelpId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createBucketListItem", arguments: ["input": ["yelpId": GraphQLVariable("yelpId")]], type: .object(CreateBucketListItem.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createBucketListItem: CreateBucketListItem? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createBucketListItem": createBucketListItem.flatMap { (value: CreateBucketListItem) -> ResultMap in value.resultMap }])
    }

    /// Adds a particular restaurant to the current user's bucket list.
    public var createBucketListItem: CreateBucketListItem? {
      get {
        return (resultMap["createBucketListItem"] as? ResultMap).flatMap { CreateBucketListItem(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createBucketListItem")
      }
    }

    public struct CreateBucketListItem: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CreateBucketListItemPayload"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("bucketListItem", type: .nonNull(.object(BucketListItem.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(bucketListItem: BucketListItem) {
        self.init(unsafeResultMap: ["__typename": "CreateBucketListItemPayload", "bucketListItem": bucketListItem.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var bucketListItem: BucketListItem {
        get {
          return BucketListItem(unsafeResultMap: resultMap["bucketListItem"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "bucketListItem")
        }
      }

      public struct BucketListItem: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["BucketListItem"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("status", type: .nonNull(.scalar(BucketListItemStatus.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, status: BucketListItemStatus) {
          self.init(unsafeResultMap: ["__typename": "BucketListItem", "id": id, "status": status])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var status: BucketListItemStatus {
          get {
            return resultMap["status"]! as! BucketListItemStatus
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }
      }
    }
  }
}

public final class DeleteBucketListItemMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation DeleteBucketListItem($yelpId: ID!) {
      deleteBucketListItem(input: {yelpId: $yelpId}) {
        __typename
        bucketListItem {
          __typename
          id
          status
        }
      }
    }
    """

  public let operationName: String = "DeleteBucketListItem"

  public var yelpId: GraphQLID

  public init(yelpId: GraphQLID) {
    self.yelpId = yelpId
  }

  public var variables: GraphQLMap? {
    return ["yelpId": yelpId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteBucketListItem", arguments: ["input": ["yelpId": GraphQLVariable("yelpId")]], type: .object(DeleteBucketListItem.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteBucketListItem: DeleteBucketListItem? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "deleteBucketListItem": deleteBucketListItem.flatMap { (value: DeleteBucketListItem) -> ResultMap in value.resultMap }])
    }

    /// Deletes a bucket list item for the current user.
    public var deleteBucketListItem: DeleteBucketListItem? {
      get {
        return (resultMap["deleteBucketListItem"] as? ResultMap).flatMap { DeleteBucketListItem(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "deleteBucketListItem")
      }
    }

    public struct DeleteBucketListItem: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["DeleteBucketListItemPayload"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("bucketListItem", type: .object(BucketListItem.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(bucketListItem: BucketListItem? = nil) {
        self.init(unsafeResultMap: ["__typename": "DeleteBucketListItemPayload", "bucketListItem": bucketListItem.flatMap { (value: BucketListItem) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var bucketListItem: BucketListItem? {
        get {
          return (resultMap["bucketListItem"] as? ResultMap).flatMap { BucketListItem(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "bucketListItem")
        }
      }

      public struct BucketListItem: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["BucketListItem"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("status", type: .nonNull(.scalar(BucketListItemStatus.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, status: BucketListItemStatus) {
          self.init(unsafeResultMap: ["__typename": "BucketListItem", "id": id, "status": status])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var status: BucketListItemStatus {
          get {
            return resultMap["status"]! as! BucketListItemStatus
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }
      }
    }
  }
}

public final class RestaurantMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Restaurant($yelpId: ID!) {
      createOrRetrieveRestaurant(input: {yelpId: $yelpId}) {
        __typename
        restaurant {
          __typename
          id
          yelpId
          name
          imageUrl
          yelpUrl
          phone
          yelpRating
          priceLevel
          favorite
          inBucketList
        }
      }
    }
    """

  public let operationName: String = "Restaurant"

  public var yelpId: GraphQLID

  public init(yelpId: GraphQLID) {
    self.yelpId = yelpId
  }

  public var variables: GraphQLMap? {
    return ["yelpId": yelpId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createOrRetrieveRestaurant", arguments: ["input": ["yelpId": GraphQLVariable("yelpId")]], type: .object(CreateOrRetrieveRestaurant.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createOrRetrieveRestaurant: CreateOrRetrieveRestaurant? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createOrRetrieveRestaurant": createOrRetrieveRestaurant.flatMap { (value: CreateOrRetrieveRestaurant) -> ResultMap in value.resultMap }])
    }

    /// Retrieves a restaurant if it exists, otherwise, creates and returns it.
    public var createOrRetrieveRestaurant: CreateOrRetrieveRestaurant? {
      get {
        return (resultMap["createOrRetrieveRestaurant"] as? ResultMap).flatMap { CreateOrRetrieveRestaurant(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createOrRetrieveRestaurant")
      }
    }

    public struct CreateOrRetrieveRestaurant: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CreateOrRetrieveRestaurantPayload"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("restaurant", type: .nonNull(.object(Restaurant.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(restaurant: Restaurant) {
        self.init(unsafeResultMap: ["__typename": "CreateOrRetrieveRestaurantPayload", "restaurant": restaurant.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var restaurant: Restaurant {
        get {
          return Restaurant(unsafeResultMap: resultMap["restaurant"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "restaurant")
        }
      }

      public struct Restaurant: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Restaurant"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("yelpId", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("imageUrl", type: .scalar(String.self)),
          GraphQLField("yelpUrl", type: .scalar(String.self)),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("yelpRating", type: .scalar(String.self)),
          GraphQLField("priceLevel", type: .scalar(String.self)),
          GraphQLField("favorite", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("inBucketList", type: .nonNull(.scalar(Bool.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, yelpId: String, name: String? = nil, imageUrl: String? = nil, yelpUrl: String? = nil, phone: String? = nil, yelpRating: String? = nil, priceLevel: String? = nil, favorite: Bool, inBucketList: Bool) {
          self.init(unsafeResultMap: ["__typename": "Restaurant", "id": id, "yelpId": yelpId, "name": name, "imageUrl": imageUrl, "yelpUrl": yelpUrl, "phone": phone, "yelpRating": yelpRating, "priceLevel": priceLevel, "favorite": favorite, "inBucketList": inBucketList])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var yelpId: String {
          get {
            return resultMap["yelpId"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "yelpId")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var imageUrl: String? {
          get {
            return resultMap["imageUrl"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "imageUrl")
          }
        }

        public var yelpUrl: String? {
          get {
            return resultMap["yelpUrl"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "yelpUrl")
          }
        }

        public var phone: String? {
          get {
            return resultMap["phone"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "phone")
          }
        }

        public var yelpRating: String? {
          get {
            return resultMap["yelpRating"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "yelpRating")
          }
        }

        public var priceLevel: String? {
          get {
            return resultMap["priceLevel"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "priceLevel")
          }
        }

        public var favorite: Bool {
          get {
            return resultMap["favorite"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "favorite")
          }
        }

        public var inBucketList: Bool {
          get {
            return resultMap["inBucketList"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "inBucketList")
          }
        }
      }
    }
  }
}

public final class ToggleFavoriteMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation ToggleFavorite($yelpId: ID!) {
      toggleFavoriteRestaurant(input: {yelpId: $yelpId}) {
        __typename
        restaurant {
          __typename
          favorite
        }
      }
    }
    """

  public let operationName: String = "ToggleFavorite"

  public var yelpId: GraphQLID

  public init(yelpId: GraphQLID) {
    self.yelpId = yelpId
  }

  public var variables: GraphQLMap? {
    return ["yelpId": yelpId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("toggleFavoriteRestaurant", arguments: ["input": ["yelpId": GraphQLVariable("yelpId")]], type: .object(ToggleFavoriteRestaurant.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(toggleFavoriteRestaurant: ToggleFavoriteRestaurant? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "toggleFavoriteRestaurant": toggleFavoriteRestaurant.flatMap { (value: ToggleFavoriteRestaurant) -> ResultMap in value.resultMap }])
    }

    /// Toggles a restaurant into/out of the current user's favorites list.
    public var toggleFavoriteRestaurant: ToggleFavoriteRestaurant? {
      get {
        return (resultMap["toggleFavoriteRestaurant"] as? ResultMap).flatMap { ToggleFavoriteRestaurant(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "toggleFavoriteRestaurant")
      }
    }

    public struct ToggleFavoriteRestaurant: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ToggleFavoriteRestaurantPayload"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("restaurant", type: .nonNull(.object(Restaurant.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(restaurant: Restaurant) {
        self.init(unsafeResultMap: ["__typename": "ToggleFavoriteRestaurantPayload", "restaurant": restaurant.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var restaurant: Restaurant {
        get {
          return Restaurant(unsafeResultMap: resultMap["restaurant"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "restaurant")
        }
      }

      public struct Restaurant: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Restaurant"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("favorite", type: .nonNull(.scalar(Bool.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(favorite: Bool) {
          self.init(unsafeResultMap: ["__typename": "Restaurant", "favorite": favorite])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var favorite: Bool {
          get {
            return resultMap["favorite"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "favorite")
          }
        }
      }
    }
  }
}
