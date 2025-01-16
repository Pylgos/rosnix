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
  version = "0.40.1-1";
  src = finalAttrs.passthru.sources."tf2_bullet";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "bullet" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tf2_bullet" = substituteSource {
      src = fetchgit {
        name = "tf2_bullet-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "55a5b6cbcf7d9fb734f042c22bd5b6e4fdec55ef";
        hash = "sha256-BgssYy5UiqyOuE7ePJi3oI7o7c4tZKg98mPL0nrORrk=";
      };
    };
  });
  meta = {
    description = "tf2_bullet";
  };
})
