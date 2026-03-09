{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtsam,
  mkSourceSet,
  mola-common,
  mrpt-libbase,
  mrpt-libmath,
  mrpt-libposes,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "gtsam2mrpt_serial";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."gtsam2mrpt_serial";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gtsam mola-common mrpt-libbase mrpt-libmath mrpt-libposes ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gtsam mola-common mrpt-libbase mrpt-libmath mrpt-libposes ];
  passthru.sources = mkSourceSet (sources: {
    "gtsam2mrpt_serial" = substituteSource {
      src = fetchgit {
        name = "gtsam2mrpt_serial-source";
        url = "https://github.com/ros2-gbp/gtsam2mrpt_serial-release.git";
        rev = "035e66d121a417a1c2ee53cf1d71de92f0cb88e1";
        hash = "sha256-8Mi/tEvxVOCHfHVZvvQm+XHBmNkdnjQ3GJVeBY44TOU=";
      };
    };
  });
  meta = {
    description = "A C++ library offering a GTSAM ⇆ mrpt-serialization bridge.";
  };
})
