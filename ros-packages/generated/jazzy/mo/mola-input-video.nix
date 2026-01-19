{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-kernel,
  mrpt-libhwdrivers,
  mrpt-libobs,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_input_video";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."mola_input_video";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mola-kernel mrpt-libhwdrivers mrpt-libobs ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-kernel mrpt-libhwdrivers mrpt-libobs ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_video" = substituteSource {
      src = fetchgit {
        name = "mola_input_video-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "57d639facd83ef86e7e8b44a488e836e0953d0fa";
        hash = "sha256-mkJuZ2Y8G8BVN7kXoXBqahdV+6LhMSa2E1L6IgVECmE=";
      };
    };
  });
  meta = {
    description = "RawDataSource from live or offline video sources";
  };
})
