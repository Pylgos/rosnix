{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "color_util";
  version = "1.0.0-4";
  src = finalAttrs.passthru.sources."color_util";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ std-msgs ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "color_util" = substituteSource {
      src = fetchgit {
        name = "color_util-source";
        url = "https://github.com/ros2-gbp/color_util-release.git";
        rev = "231c6ee5d3a4330fa1d39e1085f260961d1acaf9";
        hash = "sha256-vHOcY7emyuuqZ06vo77SGvGnnV/T+wv1Va/tHUIGXIs=";
      };
    };
  });
  meta = {
    description = "An almost dependency-less library for converting between color spaces";
  };
})
