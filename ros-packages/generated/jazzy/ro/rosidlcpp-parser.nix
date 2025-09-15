{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidlcpp_parser";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."rosidlcpp_parser";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidlcpp_parser" = substituteSource {
      src = fetchgit {
        name = "rosidlcpp_parser-source";
        url = "https://github.com/ros2-gbp/rosidlcpp-release.git";
        rev = "de18a8ec1f8c0591e7d048ed8baca4742d7bd688";
        hash = "sha256-8syFkIu3R5baYXI3+9jwozEOovWSOlPhhffyvyW9/uA=";
      };
    };
  });
  meta = {
    description = "This package provides utilities to parse idl files into a json data structure";
  };
})
