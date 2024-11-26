{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2_bullet";
  version = "0.36.5-1";
  src = finalAttrs.passthru.sources."tf2_bullet";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "bullet" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "tf2_bullet" = substituteSource {
        src = fetchgit {
          name = "tf2_bullet-source";
          url = "https://github.com/ros2-gbp/geometry2-release.git";
          rev = "542c41d8ab41f3a1713ba9244af63310852a2eb7";
          hash = "sha256-Wkl9bLpetsSPyk/ajtsVq/phDqenuuwsgMAFGaZMY2o=";
        };
      };
    });
  };
  meta = {
    description = "tf2_bullet";
  };
})
