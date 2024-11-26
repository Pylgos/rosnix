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
  pname = "tf2_eigen";
  version = "0.36.5-1";
  src = finalAttrs.passthru.sources."tf2_eigen";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "tf2_eigen" = substituteSource {
        src = fetchgit {
          name = "tf2_eigen-source";
          url = "https://github.com/ros2-gbp/geometry2-release.git";
          rev = "e079659eec6d612ea5c3631eb07d95b9cc5de628";
          hash = "sha256-wF2GZ6iwyPtXOiKbGwn3c7VWAMKsmAQmJ9suynJg+Dg=";
        };
      };
    });
  };
  meta = {
    description = "tf2_eigen";
  };
})
