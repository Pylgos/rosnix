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
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."rosidlcpp_generator_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidlcpp_generator_core" = substituteSource {
      src = fetchgit {
        name = "rosidlcpp_generator_core-source";
        url = "https://github.com/ros2-gbp/rosidlcpp-release.git";
        rev = "b3182eced1502c4e539290adf7cc1642f2efeb3d";
        hash = "sha256-cIQR3rLNQ4eCnpRsW1WDq1c8wtQKwXFtplNUka5TE4o=";
      };
    };
  });
  meta = {
    description = "This package provides the basis for all rosidlcpp generators";
  };
})
