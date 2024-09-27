{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    magic_enum-c781e21940b8046fa81dace2fe4afb291bbbcbec = substituteSource {
      src = fetchgit {
        name = "magic_enum-c781e21940b8046fa81dace2fe4afb291bbbcbec-source";
        url = "https://github.com/ros2-gbp/magic_enum-release.git";
        rev = "c781e21940b8046fa81dace2fe4afb291bbbcbec";
        hash = "sha256-maDyPAh57gP3vZwB34IYIwVCnmcDwi1msh639mFMdRE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "magic_enum";
  version = "0.9.6-1";
  src = sources.magic_enum-c781e21940b8046fa81dace2fe4afb291bbbcbec;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Static reflection for enums (to string, from string, iteration) for modern C++, work with any enum type without any macro or boilerplate code";
  };
}
