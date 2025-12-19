class UserProfile {
  final String id;
  final String name;
  final String avatarUrl;
  final int matchPercentage;
  final List<String> topArtists;
  final List<String> topMovies;
  final String bio;

  UserProfile({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.matchPercentage,
    required this.topArtists,
    required this.topMovies,
    required this.bio,
  });
}

final List<UserProfile> mockUsers = [
  UserProfile(
    id: '1',
    name: 'Alex Rivera',
    avatarUrl: 'https://i.pravatar.cc/150?u=alex',
    matchPercentage: 94,
    topArtists: ['Radiohead', 'Kendrick Lamar', 'Tame Impala'],
    topMovies: ['Parasite', 'Everything Everywhere All At Once', 'The Godfather'],
    bio: 'Cinema lover and indie rock enthusiast. Looking for concert buddies!',
  ),
  UserProfile(
    id: '2',
    name: 'Sarah Chen',
    avatarUrl: 'https://i.pravatar.cc/150?u=sarah',
    matchPercentage: 88,
    topArtists: ['Taylor Swift', 'Lana Del Rey', 'Phoebe Bridgers'],
    topMovies: ['Lady Bird', 'Little Women', 'La La Land'],
    bio: 'Sad girl autumn vibes all year round. Let\'s talk A24.',
  ),
  UserProfile(
    id: '3',
    name: 'Marcus Johnson',
    avatarUrl: 'https://i.pravatar.cc/150?u=marcus',
    matchPercentage: 76,
    topArtists: ['Drake', 'The Weeknd', 'J. Cole'],
    topMovies: ['Inception', 'Interstellar', 'The Dark Knight'],
    bio: 'Nolan fanboy. Hip hop head.',
  ),
  UserProfile(
    id: '4',
    name: 'Emily Davis',
    avatarUrl: 'https://i.pravatar.cc/150?u=emily',
    matchPercentage: 65,
    topArtists: ['Arctic Monkeys', 'The Strokes', 'Vampire Weekend'],
    topMovies: ['Grand Budapest Hotel', 'Moonrise Kingdom', 'Fantastic Mr. Fox'],
    bio: 'Wes Anderson aesthetic only.',
  ),
];

final List<String> myTopArtists = ['Radiohead', 'Pink Floyd', 'Daft Punk', 'Gorillaz', 'Massive Attack'];
final List<String> myTopMovies = ['Blade Runner 2049', 'Dune', 'Arrival', 'Ex Machina', 'Her'];
