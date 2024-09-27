{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mrpt_libmaps,
  mrpt_libposes,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    mola_pose_list-db579a61bc763053752ac2cbd4232793cbdd8056 = substituteSource {
      src = fetchgit {
        name = "mola_pose_list-db579a61bc763053752ac2cbd4232793cbdd8056-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "db579a61bc763053752ac2cbd4232793cbdd8056";
        hash = "sha256-IpZ1gQEevyLYkxFdJ99SHHLIX1maNZPTyRaU5iIgPCw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_pose_list";
  version = "1.2.0-1";
  src = sources.mola_pose_list-db579a61bc763053752ac2cbd4232793cbdd8056;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mola_common mrpt_libmaps mrpt_libposes ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "C++ library for searchable pose lists";
  };
}
