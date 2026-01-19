{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "magic_enum";
  version = "0.9.7-3";
  src = finalAttrs.passthru.sources."magic_enum";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "magic_enum" = substituteSource {
      src = fetchgit {
        name = "magic_enum-source";
        url = "https://github.com/ros2-gbp/magic_enum-release.git";
        rev = "12f640417984431ed644872937f17968a39bbf9d";
        hash = "sha256-k/gQp+L6OTEcbGSzZ1jgrLPZ1groLDuJ/8Rw1oaoZPk=";
      };
    };
  });
  meta = {
    description = "\n    Static reflection for enums (to string, from string, iteration) for modern C++,\n    work with any enum type without any macro or boilerplate code\n  ";
  };
})
