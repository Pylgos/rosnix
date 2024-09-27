{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_black-ed810c9f99b58d39dbe9b4f9c42cd3f8edeba6cd = substituteSource {
      src = fetchgit {
        name = "ament_black-ed810c9f99b58d39dbe9b4f9c42cd3f8edeba6cd-source";
        url = "https://github.com/ros2-gbp/ament_black-release.git";
        rev = "ed810c9f99b58d39dbe9b4f9c42cd3f8edeba6cd";
        hash = "sha256-CVThJWwGw8u3uwsE3Z5CF7BueCI08EkNe+eW6X/copE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_black";
  version = "0.2.6-1";
  src = sources.ament_black-ed810c9f99b58d39dbe9b4f9c42cd3f8edeba6cd;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "black" "python3-unidiff" "python3-uvloop" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "black" "python3-unidiff" "python3-uvloop" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "The ability to check code against style conventions using black and generate xUnit test result files.";
  };
}
