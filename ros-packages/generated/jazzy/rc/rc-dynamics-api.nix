{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "rc_dynamics_api";
  version = "0.10.5-2";
  src = finalAttrs.passthru.sources."rc_dynamics_api";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" "protobuf" "protobuf-dev" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "curl" "protobuf" "protobuf-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rc_dynamics_api" = substituteSource {
      src = fetchgit {
        name = "rc_dynamics_api-source";
        url = "https://github.com/ros2-gbp/rc_dynamics_api-release.git";
        rev = "adad10c595a8e0dae8721169740ac3480df23496";
        hash = "sha256-o9jsHD+cly1o6EPT+4dJfJDATxJF+nGdtaPKEOT6ZXo=";
      };
    };
  });
  meta = {
    description = "\n      The rc_dynamics_api provides an API for easy handling of the dynamic-state data\n      streams provided by Roboception's stereo camera with self-localization.\n      See http://rc-visard.com\n\n      Dynamic-state estimates of the rc_visard relate to its self-localization and\n      ego-motion estimation. These states refer to rc_visard's current pose,\n      velocity, or acceleration and are published on demand via several data streams.\n      For a complete list and descriptions of these dynamics states and the\n      respective data streams please refer to rc_visard's user manual.\n    ";
  };
})
