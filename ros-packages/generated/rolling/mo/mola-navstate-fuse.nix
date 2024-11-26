{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mola-imu-preintegration,
  mola-kernel,
  mrpt-libobs,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_navstate_fuse";
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."mola_navstate_fuse";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-imu-preintegration mola-kernel mrpt-libobs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "mola_navstate_fuse" = substituteSource {
        src = fetchgit {
          name = "mola_navstate_fuse-source";
          url = "https://github.com/ros2-gbp/mola-release.git";
          rev = "14e6e4445aa4e1ae5b698443ad9305be6a368921";
          hash = "sha256-lyrgWAPN2YfsheC8eQTh4eHYQCQtxkdEIiGXhgnxaBk=";
        };
      };
    });
  };
  meta = {
    description = "SE(3) pose and twist path data fusion estimator";
  };
})
