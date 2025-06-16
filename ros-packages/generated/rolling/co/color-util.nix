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
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."color_util";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ std-msgs ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "color_util" = substituteSource {
      src = fetchgit {
        name = "color_util-source";
        url = "https://github.com/ros2-gbp/color_util-release.git";
        rev = "f150258be9af049e293b7032a0b7f1140acab035";
        hash = "sha256-yxNUwaZe1ByPkip5QgYueZmhIqawu4KtqwoV5FXB5GU=";
      };
    };
  });
  meta = {
    description = "An almost dependency-less library for converting between color spaces";
  };
})
