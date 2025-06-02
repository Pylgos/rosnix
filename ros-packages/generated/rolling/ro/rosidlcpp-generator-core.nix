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
  rosidlcpp-parser,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidlcpp_generator_core";
  version = "0.1.0-1";
  src = finalAttrs.passthru.sources."rosidlcpp_generator_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidlcpp_generator_core" = substituteSource {
      src = fetchgit {
        name = "rosidlcpp_generator_core-source";
        url = "https://github.com/ros2-gbp/rosidlcpp-release.git";
        rev = "74b61c563344a273ba77f7ee906e05b971ab6c0e";
        hash = "sha256-O+mAHq9nX1QfUIHtNttA0JttC9vAC7OnocVYOLsWHnw=";
      };
    };
  });
  meta = {
    description = "This package provides the basis for all rosidlcpp generators";
  };
})
