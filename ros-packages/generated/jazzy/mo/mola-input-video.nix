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
  version = "1.9.0-1";
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
        rev = "b53a85e097b0ddaee1cdd651226cc1030da77e0b";
        hash = "sha256-5G5pYEVTXJQkHrKLJgD5aS50RqyXyDsBYHTr96TNfVI=";
      };
    };
  });
  meta = {
    description = "RawDataSource from live or offline video sources";
  };
})
