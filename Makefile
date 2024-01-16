generate_proto_file:
	protoc --go_out=. --go-grpc_out=. proto_src/movies.proto

list_proto_services:
	grpcurl -plaintext localhost:50051 list

list_grpc_api:
	grpcurl -plaintext localhost:50051 list moviesapp.Movie

api_get_movies:
	grpcurl -plaintext localhost:50051 moviesapp.Movie.GetMovies
api_get_movie_1:
	grpcurl -plaintext -d '{"Id": "1"}' localhost:50051 moviesapp.Movie.GetMovie

api_add_movies:
	grpcurl -plaintext -d '{"id": "1", "isbn": "0593310438","title": "batman","director":{"firstname":"matt", "lastname":"Reeves"}}' localhost:50051 moviesapp.Movie.CreateMovie
