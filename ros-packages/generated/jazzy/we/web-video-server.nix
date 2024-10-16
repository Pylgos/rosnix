{
  ament-cmake-copyright,
  ament-cmake-cpplint,
  ament-cmake-lint-cmake,
  ament-cmake-ros,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  async-web-server-cpp,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "web_video_server" = substituteSource {
      src = fetchgit {
        name = "web_video_server-source";
        url = "https://github.com/ros2-gbp/web_video_server-release.git";
        rev = "2cb69c86eccecbbaaa4bcf0664cc3e401e923732";
        hash = "sha256-W0e1agACR4evkdS+ncZdaQm4B0a+/pyWfPgkFDUNfGY=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "web_video_server";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."web_video_server";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ async-web-server-cpp cv-bridge image-transport rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ffmpeg" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-cpplint ament-cmake-lint-cmake ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "HTTP Streaming of ROS Image Topics in Multiple Formats";
  };
})
