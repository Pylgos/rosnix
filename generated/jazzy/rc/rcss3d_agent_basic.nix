{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp_components,
  rcss3d_agent,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rcss3d_agent_basic-eca722d4386f3ff65accb38b49054b6c848b9c53 = substituteSource {
      src = fetchgit {
        name = "rcss3d_agent_basic-eca722d4386f3ff65accb38b49054b6c848b9c53-source";
        url = "https://github.com/ros2-gbp/rcss3d_agent-release.git";
        rev = "eca722d4386f3ff65accb38b49054b6c848b9c53";
        hash = "sha256-nDJGmIM8WHHjNPs3KRLNXOf8EM2VIwF9YZX1CVE662Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcss3d_agent_basic";
  version = "0.4.1-4";
  src = sources.rcss3d_agent_basic-eca722d4386f3ff65accb38b49054b6c848b9c53;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp_components rcss3d_agent ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Basic rcss3d agent node that uses rcss3d_agent_msgs";
  };
}
