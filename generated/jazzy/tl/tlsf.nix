{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    tlsf-e5404343cc186e3237c2bae081bcc270af9eab45 = substituteSource {
      src = fetchgit {
        name = "tlsf-e5404343cc186e3237c2bae081bcc270af9eab45-source";
        url = "https://github.com/ros2-gbp/tlsf-release.git";
        rev = "e5404343cc186e3237c2bae081bcc270af9eab45";
        hash = "sha256-y3cjlV+RU4Go9bap7m+OMAdNUie5Z4IAVrrp7tyyBpw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tlsf";
  version = "0.9.0-3";
  src = sources.tlsf-e5404343cc186e3237c2bae081bcc270af9eab45;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "TLSF allocator version 2.4.6";
  };
}
