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
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."mola_navstate_fuse";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-imu-preintegration mola-kernel mrpt-libobs ];
  passthru.sources = mkSourceSet (sources: {
    "mola_navstate_fuse" = substituteSource {
      src = fetchgit {
        name = "mola_navstate_fuse-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "16c90bd78ce9039009d78a9c84da0417932f36bc";
        hash = "sha256-yjD7z/M6GPLWhKhdZ3reo3gTXCx2b6Wwovp11vAAMco=";
      };
    };
  });
  meta = {
    description = "SE(3) pose and twist path data fusion estimator";
  };
})
