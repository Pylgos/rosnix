{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
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
    "ament_black" = substituteSource {
      src = fetchgit {
        name = "ament_black-source";
        url = "https://github.com/ros2-gbp/ament_black-release.git";
        rev = "e327a9bfe96798c1878fd4b0e0d43ee201d73757";
        hash = "sha256-CVThJWwGw8u3uwsE3Z5CF7BueCI08EkNe+eW6X/copE=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ament_black";
  version = "0.2.6-1";
  src = sources."ament_black";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "black" "python3-unidiff" "python3-uvloop" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "black" "python3-unidiff" "python3-uvloop" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "The ability to check code against style conventions using black and generate xUnit test result files.";
  };
}
