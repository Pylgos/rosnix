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
  version = "0.9.7-1";
  src = finalAttrs.passthru.sources."magic_enum";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "magic_enum" = substituteSource {
      src = fetchgit {
        name = "magic_enum-source";
        url = "https://github.com/ros2-gbp/magic_enum-release.git";
        rev = "516bb0c4f7c6334b745f48e749bb58438c3bb269";
        hash = "sha256-sEcsbWxOpPC/BhoNxLx28+ICnWqaPOFJuqR5qPxWnas=";
      };
    };
  });
  meta = {
    description = "\n    Static reflection for enums (to string, from string, iteration) for modern C++,\n    work with any enum type without any macro or boilerplate code\n  ";
  };
})
