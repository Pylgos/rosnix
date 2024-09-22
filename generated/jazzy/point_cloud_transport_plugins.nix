{
  ament_cmake,
  buildRosPackage,
  draco_point_cloud_transport,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  point_cloud_interfaces,
  rosSystemPackages,
  substituteSource,
  zlib_point_cloud_transport,
  zstd_point_cloud_transport,
}:
let
  sources = rec {
    point_cloud_transport_plugins = substituteSource {
      src = fetchFromGitHub {
        name = "point_cloud_transport_plugins-source";
        owner = "ros2-gbp";
        repo = "point_cloud_transport_plugins-release";
        rev = "c18782cb6ee32f7c17638656243c5771d8ad8d64";
        hash = "sha256-zDt56WEUrMBu9fNwzuGnsNgSzxD/jE/5ulHFanku164=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "point_cloud_transport_plugins";
  version = "4.0.1-1";
  src = sources.point_cloud_transport_plugins;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ draco_point_cloud_transport point_cloud_interfaces zlib_point_cloud_transport zstd_point_cloud_transport ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Metapackage with common point_cloud_transport plugins";
  };
}
