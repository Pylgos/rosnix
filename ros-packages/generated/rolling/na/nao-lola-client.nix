{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nao-lola-command-msgs,
  nao-lola-sensor-msgs,
  rcl-interfaces,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "nao_lola_client" = substituteSource {
      src = fetchgit {
        name = "nao_lola_client-source";
        url = "https://github.com/ros2-gbp/nao_lola-release.git";
        rev = "4be01ae3cd50032105f32732f29481e574c9c1ed";
        hash = "sha256-EC4It9qdpgQxnpVxErStgFzOy5Uq4NCqJ4mbwm4CWjk=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "nao-lola-client";
  version = "1.3.0-1";
  src = sources."nao_lola_client";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ nao-lola-command-msgs nao-lola-sensor-msgs rcl-interfaces rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Packages that allow communicating with the NAO's Lola middle-ware.";
  };
}
