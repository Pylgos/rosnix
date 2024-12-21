{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mola-kernel,
  mrpt-libmath,
  mrpt-libobs,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_input_euroc_dataset";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."mola_input_euroc_dataset";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-kernel mrpt-libmath mrpt-libobs ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_euroc_dataset" = substituteSource {
      src = fetchgit {
        name = "mola_input_euroc_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "3c7750bd819170933c3a87e4a378f578b1f176bd";
        hash = "sha256-ZqQQydd/HBEjptux8Hbn+WxjGMRllM53lIR/3znbc5s=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from EUROC SLAM datasets";
  };
})
