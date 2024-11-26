{
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_eigen";
  version = "1.2.1-4";
  src = finalAttrs.passthru.sources."ecl_eigen";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ecl_eigen" = substituteSource {
        src = fetchgit {
          name = "ecl_eigen-source";
          url = "https://github.com/ros2-gbp/ecl_core-release.git";
          rev = "0f5856a86be05896af48e06baaddcd0f349fb700";
          hash = "sha256-tkEm2XgT3kJqdj/+L317KVB0SOyCjRKuLqsOWToPxbo=";
        };
      };
    });
  };
  meta = {
    description = "This provides an Eigen implementation for ecl's linear algebra.";
  };
})
