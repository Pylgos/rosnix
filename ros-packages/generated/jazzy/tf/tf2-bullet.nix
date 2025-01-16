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
  version = "0.36.8-1";
  src = finalAttrs.passthru.sources."tf2_bullet";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "bullet" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tf2_bullet" = substituteSource {
      src = fetchgit {
        name = "tf2_bullet-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "9dc1ec892b9a0e167ac57f4d52c50fb0b4573c5e";
        hash = "sha256-HMy1uV1sDrjvQ1tlALrRoT7u2Yaxx2tnQqO6cGthcXg=";
      };
    };
  });
  meta = {
    description = "tf2_bullet";
  };
})
