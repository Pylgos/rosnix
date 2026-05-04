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
  version = "0.5.0-2";
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
        rev = "3e7ca7f23c344cd84eada9a7884a7620e9988fac";
        hash = "sha256-M1ywwXKlQYrPLZz6czWN0EFGnfVqnUPktWGTTv7MZ9c=";
      };
    };
  });
  meta = {
    description = "This package provides utilities to parse idl files into a json data structure";
  };
})
