{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rc_dynamics_api" = substituteSource {
      src = fetchgit {
        name = "rc_dynamics_api-source";
        url = "https://github.com/ros2-gbp/rc_dynamics_api-release.git";
        rev = "adad10c595a8e0dae8721169740ac3480df23496";
        hash = "sha256-o9jsHD+cly1o6EPT+4dJfJDATxJF+nGdtaPKEOT6ZXo=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rc_dynamics_api";
  version = "0.10.5-2";
  src = sources."rc_dynamics_api";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "protobuf" "protobuf-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The rc_dynamics_api provides an API for easy handling of the dynamic-state data streams provided by Roboception's stereo camera with self-localization. See http://rc-visard.com Dynamic-state estimates of the rc_visard relate to its self-localization and ego-motion estimation. These states refer to rc_visard's current pose, velocity, or acceleration and are published on demand via several data streams. For a complete list and descriptions of these dynamics states and the respective data streams please refer to rc_visard's user manual.";
  };
}
