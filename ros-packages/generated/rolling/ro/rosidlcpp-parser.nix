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
  version = "0.1.2-1";
  src = finalAttrs.passthru.sources."rosidlcpp_parser";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidlcpp_parser" = substituteSource {
      src = fetchgit {
        name = "rosidlcpp_parser-source";
        url = "https://github.com/ros2-gbp/rosidlcpp-release.git";
        rev = "2d3de99f080760ecbbfb60301e2dead4147080d5";
        hash = "sha256-fmJKl9O5ECEhfJK7Df43gJ9x+TweQAheK80Z0d2T63E=";
      };
    };
  });
  meta = {
    description = "This package provides utilities to parse idl files into a json data structure";
  };
})
