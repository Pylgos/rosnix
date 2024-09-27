{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rcl_interfaces,
  rclpy,
  ros2action,
  ros2cli,
  ros2node,
  ros2param,
  ros2topic,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    system_fingerprint-0dd0aeb274ee7e6ecb70a2bfa77ad6d0dd0503c2 = substituteSource {
      src = fetchgit {
        name = "system_fingerprint-0dd0aeb274ee7e6ecb70a2bfa77ad6d0dd0503c2-source";
        url = "https://github.com/ros2-gbp/ros_system_fingerprint-release.git";
        rev = "0dd0aeb274ee7e6ecb70a2bfa77ad6d0dd0503c2";
        hash = "sha256-swG8fwjiFc0LXSlbA6Lml0jlh/VyNS//insRqM01fr0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "system_fingerprint";
  version = "0.7.0-4";
  src = sources.system_fingerprint-0dd0aeb274ee7e6ecb70a2bfa77ad6d0dd0503c2;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rcl_interfaces rclpy ros2action ros2cli ros2node ros2param ros2topic ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-git" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The system_fingerprint package";
  };
}
