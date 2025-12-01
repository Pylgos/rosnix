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
  version = "0.9.7-2";
  src = finalAttrs.passthru.sources."magic_enum";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "magic_enum" = substituteSource {
      src = fetchgit {
        name = "magic_enum-source";
        url = "https://github.com/ros2-gbp/magic_enum-release.git";
        rev = "eab2027d27a98fcc78d6c39df3c605b584ca8e97";
        hash = "sha256-G3sWhh6gyouE+oB3z8rR6S5hZiS5fCFCwLd9SBzmU1U=";
      };
    };
  });
  meta = {
    description = "\n    Static reflection for enums (to string, from string, iteration) for modern C++,\n    work with any enum type without any macro or boilerplate code\n  ";
  };
})
