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
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "splsm_7";
  version = "3.0.1-3";
  src = finalAttrs.passthru.sources."splsm_7";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "splsm_7" = substituteSource {
        src = fetchgit {
          name = "splsm_7-source";
          url = "https://github.com/ros2-gbp/r2r_spl-release.git";
          rev = "1f31ca4a660cf075439d3113b6a26e8c8c8253a8";
          hash = "sha256-mJ9R0CRbOAigpJZL+lmcW5OrC4wfPc83FiMx8+NKjwY=";
        };
      };
    });
  };
  meta = {
    description = "RoboCup Standard Platform League Standard Message V7 ROS msg";
  };
})
